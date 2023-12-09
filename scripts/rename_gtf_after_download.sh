#!/bin/bash

# Задайте словарь для соответствия имени файла и нового имени
declare -A renaming_dict=(
  ["GCA_001306765.1.gtf"]="1.Cobetia_sp_UCD-24C_GCF_001306765.1.gtf"
  ["GCA_030010415.1.gtf"]="10.Cobetia_amphilecti_NRIC_0815T_GCA_030010415.1.gtf"
  ["GCF_018831605.1.gtf"]="11.Cobetia_sp_4B_GCF_018831605.1.gtf"
  ["GCF_009617955.1.gtf"]="12.Cobetia_sp_AM6_GCF_009617955.1.gtf"
  ["GCF_000754225.1.gtf"]="14.Cobetia_amphilecti_KMM_296_GCF_000754225.1.gtf"
  ["GCF_024124585.1.gtf"]="15.Cobetia_sp_Dlab-2-U_GCF_024124585.1.gtf"
  ["GCF_024124625.1.gtf"]="16.Cobetia_sp_Dlab-2-AX_GCF_024124625.1.gtf"
  ["GCF_013350055.1.gtf"]="17.Cobetia_marina_402_GCF_013350055.1.gtf"
  ["GCF_016495405.1.gtf"]="18.Cobetia_sp_Cqz5-12_GCF_016495405.1.gtf"
  ["GCF_011319755.1.gtf"]="19.Cobetia_sp_MB87_GCF_011319755.1.gtf"
  ["GCF_018860945.1.gtf"]="2.Cobetia_amphilecti_B2M13_GCF_018860945.1.gtf"
  ["GCF_009931455.1.gtf"]="20.Cobetia_pacifica_GPM2_GCF_009931455.1.gtf"
  ["GCF_029846385.1.gtf"]="21.Cobetia_sp_10Alg_146_GCF_029846385.1.gtf"
  ["GCF_029846335.1.gtf"]="22.Cobetia_sp_3AK_GCF_029846335.1.gtf"
  ["GCF_030010515.1.gtf"]="23.Cobetia_pacifica_NRIC_0813T_GCF_030010515.1.gtf"
  ["GCF_027947415.1.gtf"]="24.Cobetia_sp_MMG027_GCF_027947415.1.gtf"
  ["GCF_002916775.1.gtf"]="25.Cobetia_sp_MM1IDA2H-1_GCF_002916775.1.gtf"
  ["GCF_900119965.1.gtf"]="26.Cobetia_marina_MM1IDA2H-1AD_GCF_900119965.1.gtf"
  ["GCF_013374055.1.gtf"]="27.Cobetia_sp_5-11-6-3_GCF_013374055.1.gtf"
  ["GCF_005144735.1.gtf"]="28.Cobetia_marinaT1_GCF_005144735.1.gtf"
  ["GCF_006540105.1.gtf"]="29.Cobetia_marina_NBRC_15607_GCF_006540105.1.gtf"
  ["GCF_014876835.1.gtf"]="3.Cobetia_sp_2AS1_GCF_014876835.1.gtf"
  ["GCF_013374075.1.gtf"]="30.Cobetia_sp_5-25-4-2_GCF_013374075.1.gtf"
  ["GCF_004006355.1.gtf"]="31.Cobetia_sp_ICG0124_GCF_004006355.1.gtf"
  ["GCF_001720485.1.gtf"]="32.Cobetia_marina_JCM_21022T_GCF_001720485.1.gtf"
  ["GCF_009796845.1.gtf"]="33.Cobetia_sp_L2A1_GCF_009796845.1.gtf"
  ["GCF_002213105.1.gtf"]="34.Cobetia_sp_QF-1_GCF_002213105.1.gtf"
  ["GCF_007786215.1.gtf"]="35.Cobetia_crustatorum_SM1923_GCF_007786215.1.gtf"
  ["GCF_000591415.1.gtf"]="36.Cobetia_crustatorum_JO1T_GCF_000591415.1.gtf"
  ["GCF_029846355.1.gtf"]="4.Cobetia_sp_2AS_GCF_029846355.1.gtf"
  ["GCF_029846435.1.gtf"]="5.Cobetia_sp_1AS1_GCF_029846435.1.gtf"
  ["GCF_029846315.1.gtf"]="6.Cobetia_litoralis_NRIC_0814T_GCF_029846315.1.gtf"
  ["GCF_018340035.1.gtf"]="7.Cobetia_sp_MC34_GCF_018340035.1.gtf"
  ["GCF_023161745.1.gtf"]="8.Cobetia_sp_1CM21F_GCF_023161745.1.gtf"
  ["GCF_029846405.1.gtf"]="9.Cobetia_sp_29-18-1_GCF_029846405.1.gtf"
)

# Переименование файлов
for file in GTF_files/*; do
  filename=$(basename "$file")
  newname=${renaming_dict[$filename]}
  
  # Переименование файла
  mv "$file" "GTF_files/$newname"
done
