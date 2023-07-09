from pathlib import Path

from bidsschematools import render
from bidsschematools import schema

datatypes = ["anat", "func", "dwi", "fmap", "perf", "beh", "eeg", "ieeg", "meg", ""]


def main():
    root = Path(__file__).parent.parent

    input_file = "src/folders_and_files/files.md"

    schema_obj = schema.load_schema()

    with open(root / input_file, "r") as f:
        lines = f.readlines()

    with open(root / input_file, "w") as f:
        for line in lines:
            if line.startswith("<!-- ANAT TEMPLATE" ""):
                f.write(line)
                codeblock = render.make_filename_template(
                    dstype="raw",
                    schema=schema_obj,
                    src_path=Path("https://bids-specification.readthedocs.io/en/latest/"),
                    pdf_format=False,
                    datatypes=["anat"],
                )
                codeblock = codeblock.replace(
                    "../../..", "https://bids-specification.readthedocs.io/en/latest"
                )
                f.write(codeblock)
            else:
                f.write(line)


if __name__ == "__main__":
    main()
