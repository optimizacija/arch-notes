# Jupyter

Install jupyter notebook via docker. Preferrably use portainer to manage jupyter's container via docker-compose:

```yaml
version: "2.1"
services:
  plex:
    image: jupyter/scipy-notebook:latest
    container_name: jupyter-scipy-notebook
    network_mode: host
    volumes:
      - /home/<user>/shared/jupyter:/home/jovyan/work
    restart: unless-stopped
```

## ta-lib

For doing technical analysis on financial data install [ta-lib](https://github.com/mrjbq7/ta-lib).

Enter Jupyter's container & in the terminal tab install ta-lib with `conda`.
These instructions are copied over from ta-libs's github.

```
conda install -c conda-forge ta-lib
```
