FROM python:3.8

RUN pip install --upgrade pip 
RUN pip install numpy
RUN pip install opencv-contrib-python
RUN pip install scipy
RUN pip install argparse
RUN pip install imutils
RUN pip install cmake
RUN pip install boost
RUN pip install dlib
RUN pip install flask
flasgger

RUN pwd


RUN useradd -m worker
USER worker
WORKDIR /project

RUN pip install --upgrade --user pipenv
ENV PATH=/home/worker/.local/bin:$PATH

COPY --chown=worker:worker . ./
# First we get the dependencies for the stack itself
#RUN pipenv lock -r > requirements.txt
# Now add in any for the app, that the developer has added (there seems to be
# no easy way of specifying a different location for the Pipfile, so have to 
# change the working directory!)
# Now process the combined requirements
RUN pip install -r requirements.txt

ENV PYTHONPATH=/project/deps
ENV FLASK_APP=server/__init__.py

ENV PORT=8080
EXPOSE 8080
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=8080"]