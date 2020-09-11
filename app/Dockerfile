# Use the Python3.7.2 image
FROM python:3.7.3-stretch
# Create a working directory
WORKDIR /app
# Copy source code to working dir
COPY . app.py /app/
# Install packages from requirements.txt
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt
# Expose port
EXPOSE 5000
# run the command to start uWSGI server
ENTRYPOINT [ "gunicorn","--bind","0.0.0.0:5000","run:app" ]
