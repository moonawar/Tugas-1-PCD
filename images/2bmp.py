import os
from PIL import Image

# Hardcoded input and output folders
input_folder = "./conv/"
output_folder = "./out/"

# Ensure the output folder exists
os.makedirs(output_folder, exist_ok=True)

# List of file extensions to convert
valid_extensions = ['.jpg', '.jpeg', '.png', '.webp']

# Iterate through all files in the input folder
for filename in os.listdir(input_folder):
    file_ext = os.path.splitext(filename)[1].lower()
    if file_ext in valid_extensions:
        # Open the image file
        with Image.open(os.path.join(input_folder, filename)) as img:
            # Convert to RGB mode if it's not already (for PNG/WebP with transparency)
            if img.mode in ('RGBA', 'P'):
                img = img.convert('RGB')
            
            # Get the filename without extension
            name_without_ext = os.path.splitext(filename)[0]
            
            # Save as BMP in the output folder
            output_path = os.path.join(output_folder, name_without_ext + ".bmp")
            img.save(output_path, "BMP")
            
            print(f"Converted {filename} to BMP")

print("Conversion completed.")
