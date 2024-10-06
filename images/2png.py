import os
from PIL import Image

# Hardcoded input and output folders
input_folder = "./"
output_folder = "./png/"

# Ensure the output folder exists
os.makedirs(output_folder, exist_ok=True)

# Iterate through all files in the input folder
for filename in os.listdir(input_folder):
    if filename.lower().endswith(".bmp"):
        input_path = os.path.join(input_folder, filename)
        
        # Open the BMP file
        with Image.open(input_path) as img:
            # Get the filename without extension
            name_without_ext = os.path.splitext(filename)[0]
            
            # Save as PNG in the output folder
            output_path = os.path.join(output_folder, name_without_ext + ".png")
            
            # Save as PNG with optimization
            img.save(output_path, "PNG", optimize=True)
            
            print(f"Converted {filename} to PNG")

print("Conversion completed.")
