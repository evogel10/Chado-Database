SELECT f.uniquename, bifunctional.value, location.fmin, location.fmax, location.strand
FROM feature f
JOIN cvterm polypeptide ON f.type_id = polypeptide.cvterm_id
JOIN featureprop bifunctional ON f.feature_id = bifunctional.feature_id
JOIN cvterm productprop ON bifunctional.type_id=productprop.cvterm_id
JOIN featureloc location ON f.feature_id = location.feature_id
WHERE polypeptide.name = 'polypeptide'
AND bifunctional.value LIKE '%bifunctional%';

LEFT(full_name, 32)

SELECT f.uniquename, LEFT(bifunctional.value, 30), location.fmin, location.fmax, location.strand
FROM feature f
JOIN cvterm polypeptide ON f.type_id = polypeptide.cvterm_id
JOIN featureprop bifunctional ON f.feature_id = bifunctional.feature_id
JOIN cvterm productprop ON bifunctional.type_id=productprop.cvterm_id
JOIN featureloc location ON f.feature_id = location.feature_id
WHERE polypeptide.name = 'polypeptide'
AND bifunctional.value LIKE '%bifunctional%';

SELECT f.uniquename 'Polypeptides Features', LEFT(bifunctional.value, 30) 'Gene Products', assembly.uniquename 'Assembly Features' , assemblyprop.name 'Location Type', location.fmin 'Start', location.fmax 'End', location.strand 'Strand'
FROM feature f
JOIN cvterm polypeptide ON f.type_id = polypeptide.cvterm_id
JOIN featureprop bifunctional ON f.feature_id = bifunctional.feature_id
JOIN cvterm productprop ON bifunctional.type_id = productprop.cvterm_id
JOIN featureloc location ON f.feature_id = location.feature_id
JOIN feature assembly ON location.srcfeature_id = assembly.feature_id
JOIN cvterm assemblyprop ON assembly.type_id = assemblyprop.cvterm_id
WHERE polypeptide.name = 'polypeptide'
AND productprop.name = 'gene_product_name'
AND bifunctional.value LIKE '%bifunctional%';