$(function(){
	let url = location.pathname.split('/');
	let id = url[2];
 grabRelated(id); 
})
	function grabRelated(id){
	$.ajax({
		method:"get",
		url:"/api/artist/"+id+"",
		  dataType:"json",
		success: function(data){
			artist = data;
		},
		error: function(err){
			console.log(err);
		}
	}),
	$.ajax({
		  method: "get",
		  url: "/api/"+id+"",
		 // contentType:false,
		  dataType:"json",
		  success: function(data) {
			  let related = data;
			  console.log(related);
			  let length = related.length;
			  let children = [];
			  for(let i = 0; i < related.length; i++){
				  children.push({
					  "name":related[i].name,
					  "id": related[i].id,
					  "pic":related[i].images[0].url,
						"value": 20,
						"level":"#fff",
						"type":"grey",
				  },)
			  }
			  let treeData = [
					{		
					"name":artist.name,
					"id":artist.id,
					  "pic":artist.images[0].url,
					"value": 30,
					"level":"green",
					"type":"grey",
					"children":children
					}
				]	
			  drawChart(treeData);
			  return;
			  },
			  error: function(err){
				  console.log(err);
			  }
		  });
	}
	
	function drawChart(treeData){
		console.log(treeData);
		const margin = {top: 20, right: 90, bottom: 30, left: 90},
	      width  = 900 - margin.left - margin.right,
	      height = 1600 - margin.top - margin.bottom;

	// declares a tree layout and assigns the size
	const treemap = d3.tree().size([height, width]);

	// assigns the data to a hierarchy using parent-child relationships
	let nodes = d3.hierarchy(treeData[0], d => d.children);

	// maps the node data to the tree layout
	nodes = treemap(nodes);

	// append the svg object to the body of the page
	// appends a 'group' element to 'svg'
	// moves the 'group' element to the top left margin
	const svg = d3.select("#explore").append("svg")
	        .attr("width", width + margin.left + margin.right)
	        
	        .attr("height", height + margin.top + margin.bottom),
	      g = svg.append("g")
	        // .attr("transform","translate(" + margin.left + "," + margin.top +
			// ")");

	// adds the links between the nodes
	const link = g.selectAll(".link")
	    .data( nodes.descendants().slice(1))
	  .enter().append("path")
	    .attr("class", "link")
	    .style("stroke", d => d.data.level)
	    		.attr("r", d => d.data.value*3)

	    .attr("d", d => {
	       return "M" + d.y + "," + (d.x+30)
	         + "C" + (d.y + d.parent.y) / 2 + "," + (d.x+30)
	         + " " + (d.y + d.parent.y) / 2 + "," + d.parent.x
	         + " " + d.parent.y + "," + d.parent.x;
	       });

	// adds each node as a group
	const node = g.selectAll(".node")
	    .data(nodes.descendants())
	    .enter().append("g")
	    .attr("class", d => "node" + (d.children ? " node--internal" : " node--leaf"))
	    .attr("transform", d => "translate(" + (d.y-90) + "," + (d.x+170) + " )")
	.attr("width", d => d.data.value *50)
	.attr("height", d => d.data.value *50)

	node.append("defs")	
	.append("defs:clipPath")
	.attr("id", d => "circleView"+d.data.id+"")

	.append("clipPath:circle")
	.attr("r", d => d.data.value*3)
		.attr("fill", "#fff")
	.attr("cx", d => d.data.value *6)
	.attr("cy", d => d.data.value *6);
	
	node.append("a")
	.attr("href",d=>"/explore/"+d.data.id+"")
	.append("a:image")
	.attr("xlink:href", d => d.data.pic)
		.attr("width", d => d.data.value *10)
	.attr("height", d => d.data.value *10)
	.attr("clip-path", d => "url(#circleView"+d.data.id+")")
  .attr("x", d => d.data.value + 5)
  .attr("y", d => d.data.value) 
  
  node.append("text") 
  .attr("dy", "5.4em") 
  .attr("x", d => d.data.value +40)
  .attr("y", d => d.data.value +130) 
  .style("text-anchor",  "start") 
  .style("color", "#fff")
  .text(d => d.data.name);
  
 
	
	
	}