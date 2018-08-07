module ApplicationHelper
	def simple_time(time)
		time.strftime("%Y-%m-%d %H:%M:%S")
	end

	# 色をランダムで設定
	def set_random_color
		random = Random.new()
		num = random.rand(0..7)

		colors = [
			'primary',
			'secondary',
			'danger',
			'info',
			'success',
			'warning',
			'dark',
			'light'
		]

		return colors[num]
	end
end
