.PHONY: all clean create-venv requirements dependencies converge verify

all: create-venv

.venv:
	( \
		python3 -m venv .venv && \
		. .venv/bin/activate && \
		python3 -m pip install --upgrade pip && \
		python3 -m pip install --upgrade setuptools; \
	)

# .venv:
# 	( \
# 		virtualenv .venv && \
# 		. .venv/bin/activate && \
# 		python3 -m pip install --upgrade pip && \
# 		python3 -m pip install --upgrade setuptools; \
# 	)

requirements: .venv
	( \
		. .venv/bin/activate && \
		python3 -m pip install -r requirements.txt; \
	)

create-venv: requirements
	@echo "virtualenv ready."

dependencies:
	sudo apt install -y python3-pip libssl-dev libffi-dev git python3-venv

converge:
	( \
		. .venv/bin/activate && \
		molecule converge; \
	)

verify:
	( \
		. .venv/bin/activate && \
		molecule verify; \
	)

test:
	( \
		. .venv/bin/activate && \
		molecule test; \
	)

clean:
	( \
		. .venv/bin/activate && \
		molecule destroy; \
	)
	rm -rf .venv
	rm -rf .cache
