include .env
NAME := wcms/$(DOCKER_IMAGE)
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)
$(eval GIT_USERNAME := $(if $(GIT_USERNAME),$(GIT_USERNAME),gitlab-ci-token))
$(eval GIT_PASSWORD := $(if $(GIT_PASSWORD),$(GIT_PASSWORD),$(CI_JOB_TOKEN)))
include docker/Makefile

