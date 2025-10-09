# Gold automation Makefile

PY=python
NB=discussion_demo.ipynb
NB_OUT=discussion_demo.executed.ipynb
REQ=artifacts/requirements-gold.txt
DATA=Data/simple_dataset.csv
MODEL=artifacts/linear_model.pt
MANIFEST=artifacts/manifest.json

.PHONY: all install run clean

all: install run

install:
	$(PY) -m pip install --upgrade pip
	# If you use a venv, ensure it is activated before running this
	@echo "Installing dependencies from $(REQ) if present..."
	@if [ -f $(REQ) ]; then $(PY) -m pip install -r $(REQ) || true; else echo "No requirements-gold.txt yet; will be generated on first run."; fi

run:
	@echo "Executing notebook to produce data, model, env, and manifest..."
	jupyter nbconvert --to notebook --execute $(NB) --output $(NB_OUT)
	@echo "Notebook executed. Artifacts are in artifacts/ and data in Data/."

clean:
	rm -f $(NB_OUT)
