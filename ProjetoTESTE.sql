-- Exibir clientes e status com produtos contratados
SELECT 
    c.id_cliente,
    CASE 
        WHEN c.flag_cliente_ativo = 1 THEN 'Ativo'
        ELSE 'Inativo'
    END AS status_cliente,
    STUFF((
        SELECT ', ' + p.produto_contratado
        FROM dbo.Produtos$ p
        WHERE p.id_cliente = c.id_cliente
        FOR XML PATH('')
    ), 1, 2, '') AS produtos_contratados
FROM 
    dbo.Clientes$ c
ORDER BY 
    c.id_cliente;

-- Produto mais comprado por clientes inativos
SELECT TOP 1 
    p.produto_contratado AS produto_mais_comprado, 
    COUNT(*) AS total_inativos
FROM 
    dbo.Produtos$ p
JOIN 
    dbo.Clientes$ c ON p.id_cliente = c.id_cliente
WHERE 
    c.flag_cliente_ativo = 0 -- Somente inativos
GROUP BY 
    p.produto_contratado
ORDER BY 
    total_inativos DESC;

-- Produto menos comprado por clientes inativos
SELECT TOP 1 
    p.produto_contratado AS produto_menos_comprado, 
    COUNT(*) AS total_inativos
FROM 
    dbo.Produtos$ p
JOIN 
    dbo.Clientes$ c ON p.id_cliente = c.id_cliente
WHERE 
    c.flag_cliente_ativo = 0 -- Somente inativos
GROUP BY 
    p.produto_contratado
ORDER BY 
    total_inativos ASC;

-- Produto mais comprado por clientes ativos
SELECT TOP 1 
    p.produto_contratado AS produto_mais_comprado, 
    COUNT(*) AS total_ativos
FROM 
    dbo.Produtos$ p
JOIN 
    dbo.Clientes$ c ON p.id_cliente = c.id_cliente
WHERE 
    c.flag_cliente_ativo = 1 -- Somente ativos
GROUP BY 
    p.produto_contratado
ORDER BY 
    total_ativos DESC;


-- Produto menos comprado por clientes inativos
SELECT TOP 1 
    p.produto_contratado AS produto_menos_comprado, 
    COUNT(*) AS total_ativos
FROM 
    dbo.Produtos$ p
JOIN 
    dbo.Clientes$ c ON p.id_cliente = c.id_cliente
WHERE 
    c.flag_cliente_ativo = 1 -- Somente inativos
GROUP BY 
    p.produto_contratado
ORDER BY 
    total_ativos ASC;





-- Idade mais comum entre clientes ativos
SELECT TOP 1 
    idade, COUNT(*) AS total_ativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 1
GROUP BY 
    idade
ORDER BY 
    total_ativos DESC;

-- Sexo mais comum entre clientes ativos
SELECT TOP 1 
    sexo, COUNT(*) AS total_ativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 1
GROUP BY 
    sexo
ORDER BY 
    total_ativos DESC;

-- Estado civil mais comum entre clientes ativos
SELECT TOP 1 
    estado_civil, COUNT(*) AS total_ativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 1
GROUP BY 
    estado_civil
ORDER BY 
    total_ativos DESC;

-- Nível educacional mais comum entre clientes ativos
SELECT TOP 1 
    nivel_educacional, COUNT(*) AS total_ativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 1
GROUP BY 
    nivel_educacional
ORDER BY 
    total_ativos DESC;

-- Repetir as mesmas consultas para clientes inativos
-- Idade mais comum entre clientes inativos
SELECT TOP 1 
    idade, COUNT(*) AS total_inativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 0
GROUP BY 
    idade
ORDER BY 
    total_inativos DESC;

-- Sexo mais comum entre clientes inativos
SELECT TOP 1 
    sexo, COUNT(*) AS total_inativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 0
GROUP BY 
    sexo
ORDER BY 
    total_inativos DESC;

-- Estado civil mais comum entre clientes inativos
SELECT TOP 1 
    estado_civil, COUNT(*) AS total_inativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 0
GROUP BY 
    estado_civil
ORDER BY 
    total_inativos DESC;

-- Nível educacional mais comum entre clientes inativos
SELECT TOP 1 
    nivel_educacional, COUNT(*) AS total_inativos
FROM 
    dbo.Clientes$ 
WHERE 
    flag_cliente_ativo = 0
GROUP BY 
    nivel_educacional
ORDER BY 
    total_inativos DESC;




