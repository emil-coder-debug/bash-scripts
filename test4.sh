file="${1}"
outfile="${2}"


if [[ ! -s "${file}" ]]; then

	echo "please provide a non-empty hosts file"

fi

if [[ -z "${outfile}" ]]; then

	outfile="datafile"

fi

while read -r line ; do

	url=$(echo "${line}" | xargs)

	if [[ -n "${url}" ]]; then

		if curl -s -L "${url}"; then

			echo -e "\t Found Directory File of Website"

			echo -e "\t Beginning recrusive download of page "${url}" to \"${outfile}" folder..."

			wget -r -np -q "${url}" -P "${outfile}"

		fi

	fi

done <<< (cat "${outfile}")

