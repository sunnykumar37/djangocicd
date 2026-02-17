# Use an official Python runtime as a parent image, e.g., 3.12-slim
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies first to leverage Docker's build cache
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

EXPOSE 8000
# Specify the command to run when the container starts
CMD ["python", "app.py", "manage.py", "runserver", "120.0.0.1:8000"]