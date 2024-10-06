import os
from PIL import Image

# Hardcoded input and output folders
input_folder = "./conv/"
output_folder = "./out/"

# Ensure the output folder exists
os.makedirs(output_folder, exist_ok=True)

# Iterate through all files in the input folder
for filename in os.listdir(input_folder):
    if filename.lower().endswith(".bmp"):
        input_path = os.path.join(input_folder, filename)
        
        # Open the BMP file
        with Image.open(input_path) as img:
            # Check if the image is already in grayscale
            if img.mode == 'L':
                print(f"{filename} is already in grayscale. Skipping.")
                continue
            
            # Convert to grayscale
            grayscale_img = img.convert('L')
            
            # Save as grayscale BMP in the output folder
            output_path = os.path.join(output_folder, filename)
            grayscale_img.save(output_path, "BMP")
            
            print(f"Converted {filename} to grayscale BMP")

print("Conversion completed.")
