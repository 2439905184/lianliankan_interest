extends Node2D
var select_scesen = ""
var select_answer = ""
var right_answer  = ""
var key_idx = 0
var all=[]
func _ready():
	#存入数据
	var item_obj={}
	item_obj['季节'] = "立春"
	item_obj['答案'] = "春卷"
	all.append(item_obj)
	var item_obj2 = {}
	item_obj2["季节"] = "雨水"
	item_obj2['答案'] = "龙须饼"
	all.append(item_obj2)
	var item_obj3 = {}
	item_obj3["季节"] = "惊蛰"
	item_obj3["答案"] = "驴打滚"
	all.append(item_obj3)
	var item_obj4 = {}
	item_obj4["季节"] = "春分"
	item_obj4["答案"] = "春菜"
	all.append(item_obj4)
	var item_obj5 = {}
	item_obj5["季节"] = "清明"
	item_obj5["答案"] = "青团"
	all.append(item_obj5)
	var item_obj6 = {}
	item_obj6["季节"] = "谷雨"
	item_obj6["答案"] = "香椿"
	all.append(item_obj6)
	#print_debug(all)
	#print_debug(item_obj.keys())
	pass
#季节信号 参数s:季节名称
func _on_Label_gui_input(event,s:String):
	if event is InputEventMouseButton:
		if event.is_pressed():
			select_scesen = s
			var i = 0
			for item in all:
				#print(item)
				if item["季节"] == s:
					right_answer = item["答案"]
					key_idx = i
					break
				i+=1
			print("选择的季节,",select_scesen)
#			print("选择的答案,",select_answer)
			print("正确答案,",right_answer)
			pass
	pass
#玩家选择信号
func _on_player_sel(event,s:String):
	if event is InputEventMouseButton:
		if event.is_pressed():
			select_answer = s
			#print_debug("玩家选择,",select_answer)
			if(select_scesen != "" and select_answer != ""):
				if select_answer != right_answer:
					print_debug("回答错误！")
				else:
					print_debug("回答正确")
					get_node("Line2D" + str(key_idx)).show()
	pass
