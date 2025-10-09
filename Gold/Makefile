# Gold automation Makefile

PY=python
NB=Gold/discussion_demo.ipynb
NB_OUT=Gold/discussion_demo.executed.ipynb
REQ=Gold/artifacts/requirements-gold.txt
DATA=Gold/Data/simple_dataset.csv
MODEL=Gold/artifacts/linear_model.pt
MANIFEST=Gold/artifacts/manifest.json

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
	@echo "Notebook executed. Artifacts should be in Gold/artifacts and data in Gold/Data."

clean:
	rm -f $(NB_OUT)
