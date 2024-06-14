import os
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, Request

app = FastAPI()


app.add_middleware(
  CORSMiddleware,
  allow_origins=["*"], # SI NO HAY DOMINIO USAMOS WILDCARD, MAS ADELANTE PODEMOS AGREGAR MAS URLS DE CONSULTA
  allow_credentials=True,
  allow_methods=["*"],
  allow_headers=["*"],
)

@app.get('/')
def test_main_route(request: Request):
  return {"Msg": "Hello World from Python API test"}
