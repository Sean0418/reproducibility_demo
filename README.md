# Reproducibility Demo (Bronze → Silver → Gold → Platinum)

This repository demonstrates practical, escalating standards for computational reproducibility adapted from the Nature Methods framework. The same simple ML workflow (linear regression on a synthetic dataset) is implemented at four levels:

- Bronze: Data + model + code published
- Silver: Bronze + single-command dependency setup + documented details + deterministic seeds
- Gold: Silver + one-command full automation + provenance capture (hashes, metrics, git, env)
- Platinum: Gold + true “one button” execution (Run All in notebook UI and a macOS double-click script), plus figures

Paper reference: see `paper.pdf` (excerpts from “Reproducibility standards for machine learning in the life sciences”).

## Repository structure
- `Bronze/`
  - `discussion_demo.ipynb`: Generates the dataset and trains a PyTorch linear model
  - `../Data/simple_dataset.csv`: Synthetic dataset (generated)
  - `Bronze/linear_model.pt`: Trained PyTorch state_dict (generated)
- `Silver/`
  - `discussion_demo.ipynb`: Deterministic training + environment capture
  - `Silver/Data/simple_dataset.csv`: Dataset (local copy)
  - `Silver/artifacts/linear_model.pt`: Trained model
  - `Silver/artifacts/requirements-silver.txt`: Environment freeze
  - `Silver/README.md`: OS/env, one-liner install, run order, determinism, DOIs
- `Gold/`
  - `discussion_demo.ipynb`: End-to-end + provenance (manifest + env)
  - `Gold/Data/simple_dataset.csv`: Dataset (downloaded if missing)
  - `Gold/artifacts/linear_model.pt`: Trained model
  - `Gold/artifacts/requirements-gold.txt`: Environment freeze (pip freeze)
  - `Gold/artifacts/manifest.json`: Hashes (data/model), metrics, env, git, runtime
  - `Gold/Makefile` and `Gold/run.sh`: One-command automation
  - `Gold/README.md`: Details and usage
- `Platinum/`
  - `discussion_demo.ipynb`: One-click notebook (auto-installs core deps, runs end-to-end, saves figures)
  - `Platinum/artifacts/…`: Figures and artifacts written here
  - `Platinum/Run Platinum.command`: macOS double-click launcher
  - `Platinum/Makefile` and `Platinum/run.sh`: One-command automation
  - `Platinum/README.md`: One-button usage and details
- `paper.pdf`: Criteria reference

## Data and model DOIs
- Data DOI: `10.5281/zenodo.17298664`
- Model DOI: `10.5281/zenodo.17298751`

## Quickstart
Ensure you have Python 3.13+ and `pip` available. A virtual environment is recommended:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

### Bronze (publish data + model + code)
Open and run the notebook:
```bash
jupyter lab  # or jupyter notebook
# Run all cells in Bronze/discussion_demo.ipynb
```
Outputs:
- `Data/simple_dataset.csv` (from Bronze notebook)
- `Bronze/linear_model.pt`

### Silver (adds one-liner install + docs + seeds)
Install env from captured freeze, then execute non-interactively:
```bash
python -m pip install -r Silver/artifacts/requirements-silver.txt
jupyter nbconvert --to notebook --execute Silver/discussion_demo.ipynb --output Silver/discussion_demo.executed.ipynb
```
Outputs:
- `Silver/artifacts/linear_model.pt`
- `Silver/artifacts/requirements-silver.txt`
See `Silver/README.md` for OS/env, run order, and determinism notes.

### Gold (adds full automation + provenance manifest)
One command end-to-end:
```bash
make -C Gold all
# or
./Gold/run.sh
```
Outputs:
- `Gold/artifacts/linear_model.pt`
- `Gold/artifacts/requirements-gold.txt`
- `Gold/artifacts/manifest.json` (hashes, metrics, env, git, runtime)

### Platinum (one-click notebook + figures)
One-button in the UI:
- Open `Platinum/discussion_demo.ipynb` and click “Run All”.
  - First cell can auto-install core deps (disable via `PLATINUM_AUTO_INSTALL=0`).
  - Final cell saves figures to `Platinum/artifacts/`.

Command-line or Finder:
```bash
make -C Platinum all
# or
./Platinum/run.sh
```
- macOS Finder: double-click `Platinum/Run Platinum.command`

Outputs:
- `Platinum/artifacts/salary_vs_score.png`
- `Platinum/artifacts/linear_coefficients.png`
- Other artifacts as generated

## Reproducibility levels (summary)
- **Bronze**: publish data, model, and code
- **Silver**: Bronze + one-liner deps + documented run order/OS/resources + seeded randomness
- **Gold**: Silver + single-command end-to-end + provenance (requirements freeze + manifest with hashes/metrics/git/env/runtime)
- **Platinum**: Gold + true one-button execution (Run All or double-click) and user-ready figures

## Notes
- Default execution is CPU-only; no GPU/MPS is required.
- Seeds are set (`GLOBAL_SEED=674`), but deep-learning ops on accelerators may introduce non-determinism; CPU runs are deterministic here.
- If nbconvert is used via `make -C`, Makefiles/scripts operate within their own folders so outputs land in the correct paths.
