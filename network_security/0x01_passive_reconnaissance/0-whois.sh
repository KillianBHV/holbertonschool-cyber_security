#!/bin/bash

whois "$1" | awk -F': ' '
BEGIN {
    # Initialisation tableau
}

{
    key=$1
    value=$2

    gsub(/^[ \t]+|[ \t]+$/, "", key)
    gsub(/^[ \t]+|[ \t]+$/, "", value)

    # REGISTRANT
    if (key == "Registrant Name") r_name=value
    if (key == "Registrant Organization") r_org=value
    if (key == "Registrant Street") r_street=value " "
    if (key == "Registrant City") r_city=value
    if (key == "Registrant State/Province") r_state=value
    if (key == "Registrant Postal Code") r_postal=value
    if (key == "Registrant Country") r_country=value
    if (key == "Registrant Phone") r_phone=value
    if (key == "Registrant Phone Ext") r_phone_ext=value
    if (key == "Registrant Fax") r_fax=value
    if (key == "Registrant Fax Ext") r_fax_ext=value
    if (key == "Registrant Email") r_email=value

    # ADMIN
    if (key == "Admin Name") a_name=value
    if (key == "Admin Organization") a_org=value
    if (key == "Admin Street") a_street=value " "
    if (key == "Admin City") a_city=value
    if (key == "Admin State/Province") a_state=value
    if (key == "Admin Postal Code") a_postal=value
    if (key == "Admin Country") a_country=value
    if (key == "Admin Phone") a_phone=value
    if (key == "Admin Phone Ext") a_phone_ext=value
    if (key == "Admin Fax") a_fax=value
    if (key == "Admin Fax Ext") a_fax_ext=value
    if (key == "Admin Email") a_email=value

    # TECH
    if (key == "Tech Name") t_name=value
    if (key == "Tech Organization") t_org=value
    if (key == "Tech Street") t_street=value " "
    if (key == "Tech City") t_city=value
    if (key == "Tech State/Province") t_state=value
    if (key == "Tech Postal Code") t_postal=value
    if (key == "Tech Country") t_country=value
    if (key == "Tech Phone") t_phone=value
    if (key == "Tech Phone Ext") t_phone_ext=value
    if (key == "Tech Fax") t_fax=value
    if (key == "Tech Fax Ext") t_fax_ext=value
    if (key == "Tech Email") t_email=value
}

END {
    # REGISTRANT
    printf "Registrant Name,%s\n", r_name
    printf "Registrant Organization,%s\n", r_org
    printf "Registrant Street,%s\n", r_street
    printf "Registrant City,%s\n", r_city
    printf "Registrant State/Province,%s\n", r_state
    printf "Registrant Postal Code,%s\n", r_postal
    printf "Registrant Country,%s\n", r_country
    printf "Registrant Phone,%s\n", r_phone
    printf "Registrant Phone Ext:,%s\n", r_phone_ext
    printf "Registrant Fax,%s\n", r_fax
    printf "Registrant Fax Ext:,%s\n", r_fax_ext
    printf "Registrant Email,%s\n", r_email

    # ADMIN
    printf "Admin Name,%s\n", a_name
    printf "Admin Organization,%s\n", a_org
    printf "Admin Street,%s\n", a_street
    printf "Admin City,%s\n", a_city
    printf "Admin State/Province,%s\n", a_state
    printf "Admin Postal Code,%s\n", a_postal
    printf "Admin Country,%s\n", a_country
    printf "Admin Phone,%s\n", a_phone
    printf "Admin Phone Ext:,%s\n", a_phone_ext
    printf "Admin Fax,%s\n", a_fax
    printf "Admin Fax Ext:,%s\n", a_fax_ext
    printf "Admin Email,%s\n", a_email

    # TECH
    printf "Tech Name,%s\n", t_name
    printf "Tech Organization,%s\n", t_org
    printf "Tech Street,%s\n", t_street
    printf "Tech City,%s\n", t_city
    printf "Tech State/Province,%s\n", t_state
    printf "Tech Postal Code,%s\n", t_postal
    printf "Tech Country,%s\n", t_country
    printf "Tech Phone,%s\n", t_phone
    printf "Tech Phone Ext:,%s\n", t_phone_ext
    printf "Tech Fax,%s\n", t_fax
    printf "Tech Fax Ext:,%s\n", t_fax_ext
    printf "Tech Email,%s", t_email   # ⚠️ PAS de \n final
}
' > "$1.csv"
