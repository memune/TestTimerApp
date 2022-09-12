//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Taehoon Park on 2022/09/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 벨류값을 가지고 메인 레이블의 텍스트를 셋팅
        let seconds = Int(slider.value * 60) // 0.0 - 1까지 존재함
        mainLabel.text = "\(seconds)초"
        number = seconds
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number)초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        })
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
    }
}

