# Platinum automation Makefile (One Button compatible)

PY=python
NB=discussion_demo.ipynb
NB_OUT=discussion_demo.executed.ipynb
REQ=../Gold/artifacts/requirements-gold.txt

.PHONY: all install run clean

all: install run

install:
	$(PY) -m pip install --upgrade pip
	@if [ -f $(REQ) ]; then $(PY) -m pip install -r $(REQ) || true; else echo "No gold requirements yet; proceeding."; fi

run:
	jupyter nbconvert --to notebook --execute $(NB) --output $(NB_OUT)
	@echo "Platinum notebook executed. Figures saved in Platinum/artifacts/."

clean:
	rm -f $(NB_OUT)
