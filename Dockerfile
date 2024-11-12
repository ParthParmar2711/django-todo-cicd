FROM python:3.12-slim

# Install dependencies to create a virtual environment
RUN apt-get update && apt-get install -y python3-venv

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app/

# Create and activate virtual environment
RUN python -m venv /app/venv

# Install dependencies
RUN /app/venv/bin/pip install -r requirements.txt

# Set the environment variable for Python to use the virtual environment
ENV PATH="/app/venv/bin:$PATH"
ENV PYTHONPATH="/app"

# Run the migrations command
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]


