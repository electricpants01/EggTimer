import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTextLabel: UILabel!
    var isTimerActive : Bool = false
    var eggTimer = Timer()
    var timerLeft = 210
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func processTimer(){
        if( timerLeft <= 0) {
            self.stop()
        }else{
            timerLeft -= 1
            showTimerLabel()
        }
    }
    
    func showTimerLabel(){
        myTextLabel.text = String(timerLeft)
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        if ( !isTimerActive ){
            isTimerActive = true
            eggTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector( processTimer ), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func less10Button(_ sender: Any) {
        if (timerLeft - 10 > 0){
            timerLeft -= 10
            showTimerLabel()
        }
    }
    
    @IBAction func add10Button(_ sender: Any) {
        timerLeft += 10
        showTimerLabel()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timerLeft = 210
        showTimerLabel()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        stop()
    }
    
    func stop(){
        isTimerActive = false
        eggTimer.invalidate()
    }
}

