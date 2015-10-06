def spacer
	puts '-' * 50
end

def clear_screen
	$stdin.gets
	system "clear"
end

def clear_screen_np
	system "clear"
end

def prompt
	$stdin.gets.chomp
end

