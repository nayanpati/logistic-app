# Use a minimal Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy dependency file first (optimizes caching)
COPY requirements.txt .

# Install dependencies & ensure pip is updated
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy all app files
COPY . .

# Expose the correct port (matches ECS task definition)
EXPOSE 5000

# Ensure script has execution permissions (if using shell scripts)
RUN chmod +x /app/main.py

# Use exec form to prevent process issues
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]

