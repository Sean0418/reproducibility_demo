# Gold Reproducibility README

This folder meets the Gold standard by providing a single-command, end-to-end run that installs dependencies (if captured) and executes the entire workflow to regenerate data, model, and provenance.

## System and environment
- OS: macOS Sequoia 15.6 (Darwin 24.6.0)
- Python: 3.13.3
- Hardware: Apple Silicon M4 Max (16-core CPU: 12 performance + 4 efficiency)
- Notes: Default run is CPU-only; MPS/GPU not required.

## Single command

Using make (recommended):

```bash
make -C Gold all
```

Or directly via shell script:

```bash
./Gold/run.sh
```

Both commands will execute `Gold/discussion_demo.ipynb` non-interactively and produce:
- Data: `Gold/Data/simple_dataset.csv` (downloaded from DOI if missing)
- Model: `Gold/artifacts/linear_model.pt`
- Environment freeze: `Gold/artifacts/requirements-gold.txt`
- Manifest with hashes/metrics/git/env/runtime: `Gold/artifacts/manifest.json`

## Dependency setup
- If you use a virtual environment, activate it before running.
- The install step upgrades pip and installs from `requirements-gold.txt` if present.

## Run order (notebook)
1. Configuration + reproducibility helpers
2. Torch seeding for determinism
3. Load/download dataset
4. Preview (optional)
5. Preprocess, deterministic train/eval in PyTorch, save model
6. Capture environment (freeze) and write manifest with hashes/metrics/git/env/runtime

## Determinism
- Global seed: `GLOBAL_SEED=674` (NumPy and Torch seeding set in notebook)
- Note: Deep-learning backends may exhibit non-determinism with some accelerators; CPU run is deterministic for this workflow.

## Data and model availability
- Data DOI: `10.5281/zenodo.17298664`
- Model DOI: `10.5281/zenodo.17298751`

## Expected runtime and resources
- CPU used: 16 cores
- GPU/MPS used: no
