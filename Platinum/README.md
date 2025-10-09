# Platinum Reproducibility README (One Button)

This notebook is set up so you can click Run All (the play button in the top right) to perform the entire workflow: install missing deps, download data if needed, train/evaluate, save artifacts, capture provenance, and generate figures.

## System and environment
- OS: macOS Sequoia 15.6 (Darwin 24.6.0)
- Python: 3.13.3
- Hardware: Apple Silicon M4 Max (16-core CPU: 12 performance + 4 efficiency)
- Notes: Default run is CPU-only; MPS/GPU not required.

## One Button in the notebook
- Open `Platinum/discussion_demo.ipynb` and click Run All.
- The first cell optionally auto-installs core dependencies (disable by setting env `PLATINUM_AUTO_INSTALL=0`).
- The final cell saves figures to `Platinum/artifacts/`.

## Finder One Button
- Double-click `Platinum/Run Platinum.command` to run the same workflow without opening the notebook UI.

## Terminal One Button
```bash
make -C Platinum all
# or
./Platinum/run.sh
```

## Notebook run order
1. Optional auto-install of core packages
2. Configuration + reproducibility helpers
3. Torch seeding for determinism
4. Load/download dataset
5. Preview (optional)
6. Preprocess, deterministic train/eval in PyTorch, save model, capture env + manifest
7. Generate and save figures (PNG) to `Platinum/artifacts/`

## Determinism
- Global seed: `GLOBAL_SEED=674` (NumPy and Torch seeding set in notebook)

## Data and model availability
- Data DOI: `10.5281/zenodo.17298664`
- Model DOI: `10.5281/zenodo.17298751`

## Outputs
- Figures: `Platinum/artifacts/salary_vs_score.png`, `Platinum/artifacts/linear_coefficients.png`
- Other artifacts and provenance are produced by the notebook cells.

## Expected runtime and resources
- CPU used: 16 cores
- GPU/MPS used: no

## Notes
- To skip auto-installs in-notebook: set `PLATINUM_AUTO_INSTALL=0` in your environment before running.
