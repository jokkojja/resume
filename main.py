from pathlib import Path

from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")

html_path = Path("static/index.html")


@app.get("/", response_class=HTMLResponse)
async def read_index():
    html_content = html_path.read_text(encoding="utf-8")
    return HTMLResponse(content=html_content)
