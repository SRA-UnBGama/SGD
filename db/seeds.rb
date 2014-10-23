# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Competence.create ([{ :name_competence  => "Presta atendimento aos cidadãos,
 	sem distinção ou preconceito, com cortesia,    precisão e agilidade 
 	baseando-se no interesse público e nas normas internas da UnB.", 
 	:type_competence => "Fundamental", :is_active_competence => true}])


Competence.create ([{ :name_competence =>"Redige textos, sem erros, utilizando 
	aplicativos de textos e baseando-se nas normas de Redação Oficial." ,
	:type_competence=> "Fundamental",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Utiliza sistemas informatizados corretamente
	 de modo a facilitar a recuperação das informações."  ,
	 :type_competence=> "Fundamental",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Demonstra iniciativa para solucionar os 
	problemas referentes à sua área de atuação de forma oportuna e respeitando 
	o fluxo de processos na Universidade e a respectiva legislação." ,
	:type_competence=> "Fundamental",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Colabora com os colegas de trabalho, de 
	modo a favorecer um clima de respeito e harmonia.",
	:type_competence=> "Fundamental",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Estabelece metas, acompanha e avalia o desempenho
	da equipe identificando as necessidades de capacitação
	a partir das lacunas de competências.",
	:type_competence=> "Gerencial",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Busca solucionar problemas referentes às condições
	do ambiente físico de trabalho (ventilação, iluminação,
	móveis ergonômicos, recursos materiais etc.) e
	condições socioprofissionais (clima organizacional,
	relacionamento interpessoal, qualidade de vida etc.).",
	:type_competence=> "Gerencial",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Estabelece responsabilidades individuais considerando
	as competências da equipe, promovendo um ambiente
	participativo e de compartilhamento de conhecimento.",
	:type_competence=>"Gerencial",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Planeja as ações da área em que atua, em conformidade
	com os prazos estabelecidos e o orçamento previsto,
	tendo em vista os princípios orçamentários e as noções
	básicas de contabilidade, vinculando ao planejamento
	institucional.",
	:type_competence=> "Gerencial",:is_active_competence => true}])

Competence.create ([{ :name_competence =>"Fornece, ao superior imediato, informações relevantes à
	tomada de decisão, considerando os aspectos legais e as
	estratégias da área.",
	:type_competence=> "Gerencial",:is_active_competence => true}])

LearningSolution.create([{ :description => "Aprendizagem em serviço da operalização dos sistemas
	pertinentes à área.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Ética no Serviço.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Curso a distância de Atendimento ao Cidadão.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Formação Gerencial.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Legislação Aplicada à Gestão de
	Pessoas Lei nº 8.112/90.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Curso a distância de Redação Oficial.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Reuniões em que todos tenham oportunidade de participação.",
	:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Informática Básica - Módulo Windows e Word.",
	:category => "À Distância"}])

LearningSolution.create([{ :description => "Leitura e compreensão do novo acordo ortográfico.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Orientação no trabalho quanto às práticas colaborativas.",
	:category => "Presencial"}])