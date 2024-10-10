select b.serviceid || '|' || -- servicio
d.id_tipo_usuario || '|' || --Tipo
round(SUM(a.consumo_bytes_total) / 1024, 0)  || '|' || -- kb
COUNT(DISTINCT(a.tele_numb))|| '|' -- cant. usuarios
FROM tbl_fact_datos_trafico_usu_202005 a
JOIN tbl_dim_serviceid_t1 b ON (a.sk_serviceid = b.id_serviceid)
JOIN tbl_dim_rating_group_t2 c ON (a.sk_rating_group = c.id_rating_group)
JOIN tbl_dim_tipousuario_t1 d ON (a.sk_charging_characteristics = d.id_tipo_usuario)
JOIN tbl_dim_apnnetwork_t1 e ON (a.sk_apnnetwork = e.id_apn)
JOIN TBL_DIM_MUNICIPIO_T2 h on (H.SK_MUNICIPIO = a.SK_MUNICIPIO)
WHERE  c.rating_group IN ('101')
GROUP BY b.serviceid,
d.id_tipo_usuario;
