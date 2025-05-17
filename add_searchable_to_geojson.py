import json
import sys
from pathlib import Path
import os

if len(sys.argv) < 2:
    print("❌ No filename provided to the script.")
    sys.exit(1)

filename = sys.argv[1]
current_dir = Path(__file__).parent.resolve()
geojson_path = current_dir / filename

if not geojson_path.exists():
    print(f"❌ File not found: {geojson_path}")
    sys.exit(1)

with open(geojson_path, "r", encoding="utf-8") as f:
    data = json.load(f)

for feature in data.get("features", []):
    props = feature.get("properties", {})
    searchable = " | ".join(f"{k}: {v}" for k, v in props.items() if v is not None)
    props["searchable"] = searchable
    feature["properties"] = props

with open(geojson_path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)

print(f"✅ 'searchable' field added to: {geojson_path}")
