all: base

base:
	docker build -f docker/Dockerfile \
	    -t $(NAME):$(VERSION) \
	    --no-cache \
	    --build-arg http_proxy=$$HTTP_PROXY \
	    --build-arg HTTP_PROXY=$$HTTP_PROXY \
	    --build-arg https_proxy=$$HTTP_PROXY \
	    --build-arg HTTPS_PROXY=$$HTTP_PROXY \
	    --build-arg no_proxy=$$NO_PROXY \
	    --build-arg NO_PROXY=$$NO_PROXY \
	    --build-arg GIT_USERNAME=$(GIT_USERNAME) \
	    --build-arg GIT_PASSWORD=$(GIT_PASSWORD) .

behat:
	[ -z "$SKIP_ADOBE_ANALYTICS" ] && ./docker/bin/drush -y config:set stc_adobe_analytics.config asset_host localhost || true
	./docker/bin/behat -vv -c behat.yml --colors

build: all

clean: clean_composer clean_ci clean_docker
	sudo rm -rf files_private

clean_composer:
	sudo rm -rf html
	rm -rf vendor
	rm -f composer.lock
	composer clear-cache

clean_ci:
	# Don't delete the ci folder for now, as we don't have it inherited on github (form another repo).
	#rm -rf .gitlab-ci
	#git clone $(CI_REPO) .gitlab-ci

clean_docker:
	# Don't delete docker folder for now, as we don't have it inherited on github (form another repo).
	#rm -rf docker
	#git clone $(DOCKER_REPO) docker
	[ "$(shell docker images -q --filter "dangling=true")" = "" ] || docker rmi -f $(shell docker images -q --filter "dangling=true")
	[ "$(shell docker ps -a -q -f name=${DOCKER_NAME}_)" = "" ] || docker rm -f $(shell docker ps -a -q -f name=${DOCKER_NAME}_)
	[ "$(shell docker images -q -f reference=${DOCKER_IMAGE}_*)" = "" ] || docker rmi -f $(shell docker images -q -f reference=*${DOCKER_IMAGE}_*)
	[ "$(shell docker images -q -f reference=${NAME})" = "" ] || docker rmi -f $(shell docker images -q -f reference=${NAME})

clean_site: clean composer_install base docker_build drupal_install
	./docker/bin/drush cr

composer_install:
	composer install

docker_build:
	docker-compose build --no-cache
	docker-compose up -d

drupal_cs:
	[ ! -d html/core ] || cp docker/conf/phpcs.xml html/core/phpcs.xml

drupal_unit:
	[ ! -d html/core ] || cp docker/conf/phpunit.xml html/core/phpunit.xml

drupal_install:
	docker-compose exec -T cli bash /var/www/docker/bin/cli drupal-first-run $(DB_NAME)

drupal_migrate:
	docker-compose exec -T cli bash /var/www/docker/bin/cli drupal-migrate $(PROFILE_NAME)

drush_archive:
	./docker/bin/drush archive-dump --destination="/var/www/files_private/drupal$$(date +%Y%m%d_%H%M%S).tgz" \
                                  --generator="Drupal"

env:
	eval $$(docker-machine env default)

lint:
	./docker/bin/lint

# http://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

phpcs: drupal_cs
	./docker/bin/phpcs --config-set installed_paths /var/www/vendor/drupal/coder/coder_sniffer
	./docker/bin/phpcs --standard=/var/www/html/core/phpcs.xml \
	    --extensions=php,module,inc,install,test,profile,theme \
	    --report=full \
	    --colors \
	    --ignore=*.css \
	    --ignore=*.txt \
	    --ignore=*.md \
	    --ignore=/var/www/html/*/custom/*/*.info.yml \
	    /var/www/html/profiles/$(PROFILE_NAME)/modules/custom

	./docker/bin/phpcs --standard=/var/www/html/core/phpcs.xml \
	    --extensions=php,module,inc,install,test,profile,theme \
	    --report=full \
	    --colors \
	    -l \
	    /var/www/html/profiles/$(PROFILE_NAME)

phpunit: drupal_unit
	./docker/bin/phpunit --colors=always \
	    --testsuite=kernel \
	    --group $(PROFILE_NAME)

	./docker/bin/phpunit --colors=always \
	    --testsuite=unit \
	    --group $(PROFILE_NAME)

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make base'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

test: lint phpcs phpunit behat

up:
	docker-machine start default
	eval $$(docker-machine env default)
	docker-compose up -d

update: base
	git pull origin 8.x
	composer update
	docker-compose build --no-cache
	docker-compose up -d

.PHONY: \
	all \
	base \
	behat \
	build \
	clean \
	clean_composer \
	clean_ci \
	clean_docker \
	clean_site \
	composer_install \
	docker_build \
	drupal_cs \
	drupal_unit \
	drupal_install \
	drupal_migrate \
	drush_archive \
	env \
	lint \
	list \
	phpcs \
	phpunit \
	release \
	tag_latest \
	test \
	up \
	update
