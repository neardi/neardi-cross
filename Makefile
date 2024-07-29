TARGETS := amd64 arm64
UBUNTU_VERSIONS := 18.04 20.04 22.04

.PHONY: $(TARGETS) $(UBUNTU_VERSIONS) all

all: $(TARGETS)

amd64: $(addprefix amd64-,$(UBUNTU_VERSIONS))
arm64: $(addprefix arm64-,$(UBUNTU_VERSIONS))

$(addprefix amd64-,$(UBUNTU_VERSIONS)):
	@echo Building amd64 environment for $(@:amd64-%=%)...
	@docker build -q -t ubuntu:$(@:amd64-%=%)-amd64 -f amd64/amd64-$(@:amd64-%=%) .

$(addprefix arm64-,$(UBUNTU_VERSIONS)):
	@echo Building arm64 environment for $(@:arm64-%=%)...
	@docker build -q -t ubuntu:$(@:arm64-%=%)-arm64 -f arm64/arm64-$(@:arm64-%=%) .

amd64/%:
	@echo Building amd64 environment for $*...
	@docker build -q -t ubuntu:$*-amd64 -f amd64/amd64-$* .

arm64/%:
	@echo Building arm64 environment for $*...
	@docker build -q -t ubuntu:$*-arm64 -f arm64/arm64-$* .
