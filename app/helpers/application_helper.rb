module ApplicationHelper
	# timestampをY-m-d H:M:Sに変更
	def simple_time(time)
		time.strftime("%Y-%m-%d %H:%M:%S")
	end

	# timestampをYmdHMSに変更
	def timestamp_to_number(time)
		time.strftime("%Y%m%d%H%M%S")
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
