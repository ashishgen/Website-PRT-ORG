# Use a base image (you can choose any base image)
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Set working directory
WORKDIR /app
ADD ./var/www/html/
# Copy the current directory contents into the container at /app
ADD . /app

# Install any required packages (if applicable)
RUN pip3 install -r requirements.txt

# Expose the port your app will run on (optional)
EXPOSE 80

# Command to run your app (adjust to your app's needs)
CMD ["python3", "app.py"]
ENTRYPOINT apachectl -D FOREGROUND
