# Use the Python3.7.2 image
FROM python:3.8.1-alpine
# Create a working directory
WORKDIR /app
# Copy source code to working directory
COPY . app.py /app/
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -r requirements.txt
# Expose port
EXPOSE 5000
# run the command to start uWSGI server
ENTRYPOINT [ "gunicorn","--bind","0.0.0.0:5000","run:app" ]
