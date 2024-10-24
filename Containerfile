FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN id_unlocker create-db
RUN id_unlocker populate-db
RUN id_unlocker add-user -u admin -p admin
EXPOSE 5000
CMD ["id_unlocker", "run"]
