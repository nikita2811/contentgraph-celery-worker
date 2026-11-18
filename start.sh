#!/bin/sh
set -e

# health endpoint for the platform's port check
python health.py &

# 'exec' so Celery receives shutdown signals
exec celery -A contentgraph_backend worker -Q default --loglevel=info --concurrency=2