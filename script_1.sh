curl -s https://cvedb.shodan.io/cves | jq -r '.cves[] | select(.references | length > 0) | [.cve_id, .summary, .references[0], .published_time] | @tsv' | shuf -n 1 | sed "s/\n//g" | while IFS=$'\t' read -r cve_id summary reference published_time; do curl -s -X POST https://api.telegram.org/bot***/sendMessage -d "chat_id=-***&text=***$(echo $cve_id):*** $(curl -s -X POST GET https://api.codebazan.ir/translate/ -d form=en -d to=fa -d text="$(echo $summary)")

#CVE | $(echo $published_time | sed 's/T/ /g')
[$(echo $cve_id)]($(echo $reference))" -d parse_mode=Markdown; done
