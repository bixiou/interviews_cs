# This script can be used to separate audio from a .webm file to a mp3 file
  # It uses ffmpeg, make sure it is install before running (directions: https://cran.r-project.org/web/packages/act/vignettes/install_ffmpeg.html)
  # Option to run for individual files and for multiple files by looping over all .webm files within a folder

## INDIVIDUAL FILE ##

# filepath for individual file
#input_file <- "file.webm"
#output_file <- "file.mp3"
  
# create mp3 file
#system(paste(
#  "ffmpeg -y -i", shQuote(input_file),
#  "-vn -acodec libmp3lame -qscale:a 2",
#  shQuote(output_file)))


## MULTIPLE FILES ##

# set path to input folder that contains .webm files and output file where .mp3 files will be added
input_folder <- "recordings"
output_folder <- "audio"

# get .webm files
webm_files <- list.files(
  path = input_folder,
  pattern = "\\.webm$",
  full.names = TRUE,
  ignore.case = TRUE
)

# loop over .webm files
for (input_file in webm_files) {
  
  # get filename
  base_name <- tools::file_path_sans_ext(basename(input_file))
  
  # output filename
  output_file <- file.path(output_folder, paste0(base_name, ".mp3"))
  
  # separate audio
  audio_sep <- paste(
    "ffmpeg -y -i", shQuote(input_file),
    "-vn -acodec libmp3lame -qscale:a 2",
    shQuote(output_file))
  
  # run conversion
  system(audio_sep)
  
  #progress tracker
  cat("Converted:", basename(input_file), "\n")
}


