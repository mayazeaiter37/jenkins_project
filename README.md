# jenkins_project — Lab 10 (Maya Zeaiter)

Python project with a Jenkins CI/CD pipeline.

- `app.py` — the application (`greet`)
- `tests/test_app.py` — unit test
- `Jenkinsfile_Maya_Zeaiter` — pipeline: Setup → Lint → Test → Coverage → Security Scan → Deploy
- `scripts/deploy.sh` — simple local deployment (versioned release folder + `current` symlink + smoke test)

Jenkins job: **Python-CI-CD**, *Pipeline script from SCM*, Git, branch `main`, script path `Jenkinsfile_Maya_Zeaiter`.
