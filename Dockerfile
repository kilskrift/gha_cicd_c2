# Use an official Anaconda runtime as a parent image
FROM continuumio/miniconda3:latest

# Set the working directory to /app
WORKDIR /app

# Copy the environment.yml file into the container
COPY environment.yml .

# Create the conda environment from the environment.yml file
RUN conda env create -f environment.yml

# Activate the environment and ensure it is used by default
RUN echo "conda activate base" >> ~/.bashrc
ENV PATH /opt/conda/envs/base/bin:$PATH

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 3000 for the FastAPI web API
EXPOSE 3000

# Start the FastAPI app using uvicorn
CMD ["python", "app.py"]