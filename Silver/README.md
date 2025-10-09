# Silver Reproducibility README

This README records the information required by the Silver standard: single-command dependency setup, key analysis details (run order, OS/resources/time), and deterministic settings.

## System and environment
- OS: macOS Sequoia 15.6 (Darwin 24.6.0)
- Python: 3.13.3
- Hardware: Apple Silicon M4 Max (16-core CPU: 12 performance + 4 efficiency)
- Notes: Notebook runs on CPU by default; MPS/GPU not used.

## Single-command dependency setup
If using a virtual environment (recommended):

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

Install project dependencies in one command:

```bash
python -m pip install -r Silver/artifacts/requirements-silver.txt
```

## Run order and how to execute
The Silver workflow is contained in `Silver/discussion_demo.ipynb` and proceeds in this order:
1. Configuration and helper functions
2. Torch seeding for determinism
3. Load dataset from `Silver/Data/simple_dataset.csv` (download from DOI if missing)
4. Preview data (optional)
5. Preprocess, deterministic train/eval in PyTorch, save model to `Silver/artifacts/linear_model.pt`
6. Capture environment to `Silver/artifacts/requirements-silver.txt`

Interactive run: open the notebook and run all cells in order.

Non-interactive option (single command):

```bash
jupyter nbconvert --to notebook --execute Silver/discussion_demo.ipynb --output Silver/discussion_demo.executed.ipynb
```

## Determinism
- Global seed: `GLOBAL_SEED=674`
- Numpy and Torch seeds set in notebook
- Notes: Deep-learning ops can be non-deterministic on some backends; this notebook does not require GPU and runs deterministically on CPU. If using MPS/GPU, exact bitwise matches are not guaranteed.

## Data and model availability
- Data (local): `Silver/Data/simple_dataset.csv`
- Model (local): `Silver/artifacts/linear_model.pt`
- Data DOI: `10.5281/zenodo.17298664`
- Model DOI: `10.5281/zenodo.17298751`

## Expected runtime and resources
- CPU used: 16 cores
- GPU/MPS used: no

## Notes
- Ensure you have write permissions in `Silver/artifacts/` to save the model and environment file.
- For fully automated Bronze→Silver→Gold workflows, consider adding a `Makefile` or Snakemake in future (not required for Silver).
