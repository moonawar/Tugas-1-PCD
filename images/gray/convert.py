from PIL import Image
import os

# Hard-coded input and output folder paths
INPUT_FOLDER = "./"
OUTPUT_FOLDER = "./out/"

def convert_to_grayscale(input_path, output_path):
    try:
        with Image.open(input_path) as img:
            grayscale_img = img.convert('L')
            grayscale_img.save(output_path)
        print(f"Converted {os.path.basename(input_path)} to grayscale")
    except Exception as e:
        print(f"Error processing {os.path.basename(input_path)}: {str(e)}")

def process_folder():
    # Create output folder if it doesn't exist
    if not os.path.exists(OUTPUT_FOLDER):
        os.makedirs(OUTPUT_FOLDER)

    # Process all image files in the input folder
    for filename in os.listdir(INPUT_FOLDER):
        if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.tiff')):
            input_path = os.path.join(INPUT_FOLDER, filename)
            output_path = os.path.join(OUTPUT_FOLDER, f"{filename}")
            convert_to_grayscale(input_path, output_path)

    print("Conversion complete!")

# Run the script
if __name__ == "__main__":
    process_folder()
