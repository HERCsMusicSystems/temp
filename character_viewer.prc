
import studio
import http
import gurps
import characters

program character_viewer [router route controller_character_list controller_character view_character_link view_character resources]

[[controller_character_list *req *res]
	[*res "HTTP/1.1 200 OK\n\n<body>\n"]
	[*res "<h1><center>CHARACTERS</center></h1>"]
	[*res "<div align=center>"] [view_character_link *res] [*res "</div>"]
	[*res "</body>"]
]

[[controller_character *req *res *character]
	[delallcl view_character] [load "character_views.prc"]
	[*res "HTTP/1.1 200 OK\n\n<body>\n"]
	[view_character *res *character]
	[*res "</body>"]
]

[[view_character_link *res]
	[character *link]
	[GET *res character *link *link] [*res "<br/>"]
	fail
]
[[view_character_link : *]]

[[router *req *res] [*req HTTP_URI : *route] [route *req *res : *route]]

[[route *req *res GET "index"] [controller_character_list *req *res]]
[[route *req *res GET ''] [controller_character_list *req *res]]
[[route *req *res GET character *character] [controller_character *req *res *character]]
[[route *req *res GET character resources *file : *] [*res [] : *file]]
[[route *req *res GET ""] [*res "HTTP/1.0 200 OK\n\n<body><h1>Prolog Webserver</h1></body>"]]
[[route *req *res : *] [*res "HTTP/1.1 401 Not found\n\n"]]

end .

[daemon service 3008 router]

[command]

[exit]





















