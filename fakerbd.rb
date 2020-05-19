require 'faker'

@emailG=Array.new

def emailFun(size)
i=0
emails=[]
	until(i>=size)
	emails<< Faker::Internet.email
	i=i+1
	end
emails
end

def tblPessoa(size)
i=0;
@emailG =emailFun(size)
until(i>=size)
	puts("INSERT INTO pessoa values('#{@emailG[i]}','senha#{i}','#{Faker::PhoneNumber.cell_phone}','#{Faker::Nation.nationality}')")
	i=i+1
end
end

def tblAdmin(size)
i=0;
until(i>=size/2)
	puts("INSERT INTO administrador values('#{@emailG[i]}');")
	i=i+1
end
end

def tblUser(size)
i=size/2;
until(i>=size)
	puts("INSERT INTO utilizador values('#{@emailG[i]}');")
	i=i+1
end
end

def tblMovies(size)
i=size/2;
until(i>=size)
	puts("INSERT INTO filmes values('#{@emailG[i]}');")
	i=i+1
end

end
## Inicialize

def chooseOther()
puts "2-Table Administradores"
puts "3-Table Utilizadores"

choose = Integer(gets)
	case choose
		when 2 
				if(!@emailG.empty?)
				tblAdmin(@emailG.size)	
				chooseOther()	
				end
		when 3 
				if(!@emailG.empty?)
					tblUser(@emailG.size)	
					chooseOther()	
				end
		when 4
			puts "Input when movies you want"
			mouves(gets);
		else
			puts "Not define yet"	
	end
end

## Inicialize
puts "Project of data base fct-unl"
puts "Choose the table"
puts "1-Table Pessoa"



choose = Integer(gets)

case choose
	when 1
		puts "Input the size of table"
		tblPessoa(Integer(gets))
		chooseOther()	
	else
		puts "Not define yet"
end
