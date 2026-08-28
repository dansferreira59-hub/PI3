INSERT INTO categorias (nome, descricao) VALUES
('Guias Simples 1 Fio', 'Guias de proteção e conexão em fio único de miçangas, cristais ou elementos naturais.'),
('Brajás e Guias Multifios', 'Guias robustas de 3 a 14 fios com trançados, firmas importadas e búzios africanos.'),
('Acessórios e Patuás', 'Pulseiras, chicotes, patuás de proteção e colares sagrados.'),
('Altar e Utilitários Rituais', 'Taças decoradas, castiçais, incensários e itens para consagração de altares.'),
('Ferramentas e Símbolos', 'Ferramentas dos Orixás e Entidades em escala artesanal, como tridentes e abebês.'),
('Wicca e Sagrado Feminino', 'Artefatos dedicados à egrégora neopagã, cultos à Deusa, pentáculos e caixas de consagração.')
ON CONFLICT (nome) DO NOTHING;