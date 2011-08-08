var magicRect;

function randomFromTo(shakingNumber)
{
    
    var from = 0;
    var to = shakingNumber;
    
    randomNum =  Math.floor(Math.random() * (to - from + 1) + from);
    
    if(randomNum < (shakingNumber / 2))
        randomNum *= -1;
        
    return randomNum;
}


var boundHeight = 16;
var boundWidth = 820;

function getRectangle(boundHeight, boundWidth, startPoint)
{
    
    magicRect = new Path.Rectangle(startPoint.x, startPoint.y - (boundHeight / 2), boundWidth, boundHeight);
    
    magicRect.strokeColor = 'white';
    magicRect.fillColor = 'white';
}



function draw()
{
    
    
    var line = new Path();
    line.strokeColor = 'red';
    line.fillColor = 'red';
    
    var startPoint = new Point(100, 100);
    var segmentLenght = 40;
    var segmentShaking = 4;
    var size = 20;
    var lineWeight = 3;
    
    var prevPoint = startPoint;
    for(var i = 0; i < size; i++)
    {
        
        var currentPoint = new Point(prevPoint.x + segmentLenght, startPoint.y + randomFromTo(segmentShaking));
        line.add(currentPoint);
        
        prevPoint = currentPoint;
    }
    
    for(var i = size - 3; i >= 1; i--)
    {  
        
        line.add(new Point(line.segments[i].point.x, line.segments[i].point.y + lineWeight));
    }
    
    line.closed = true;
    
    line.smooth();
    
    getRectangle(16, 820, startPoint);
    
    var text = new PointText(new Point(50, 50));
    text.content = 'Привет, Андрей';
    text.characterStyle =   {
                                fontSize: 20,
                                font: 'Itt',
                                fillColor: 'black'
                            };
                            
                            text.fullySelected = true;
    
    console.log(text);
}

function onFrame(event) {

    magicRect.position.x += 20;
}

draw();      
