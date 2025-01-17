#!/bin/bash

titlecase() {
  sed 's/\b[a-z]/\u&/g' <<<"$1"
}

print_padding() {
  for ((i = 0; i < $1; i++)); do
    echo
  done
}

round_to_even() {
  local num="$1"
  local remainder=$((num % 2))

  if ((remainder == 0)); then
    # Number is already even
    echo "$num"
  else
    # Round to the nearest even number
    echo $((num - remainder + 2))
  fi
}

# Get list and count of pokemon
list=$(pokemon-colorscripts -l)
list_count=$(echo "$list" | wc -l)

# Get random position pokemon name within list_count
random_number=$((RANDOM % $list_count + 1))
name=$(echo "$list" | sed -n "$random_number p")

# Fetch pokemon picture based on name
picture=$(pokemon-colorscripts -n "$name" --no-title)

# Set the desired maximum height
max_height=28

# Count and round the lines in the output
# line_count=$(echo "$picture" | wc -l)
line_count=$(round_to_even $(echo "$picture" | wc -l))

# Calculate picture padding
top_picture_padding=$(((max_height - line_count) / 2))
bottom_picture_padding=$(((max_height - top_padding - line_count) / 2))

# Print output
print_padding $top_picture_padding
echo "$picture"
print_padding $bottom_picture_padding
echo $(titlecase "$name")
