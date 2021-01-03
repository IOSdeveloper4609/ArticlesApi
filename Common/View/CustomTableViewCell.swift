//
//  CustomTableViewCell.swift
//  NewsApi
//
//  Created by Азат Киракосян on 07.12.2020.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    var avatarImageView = UIImageView()
    let descriptionLabel = UILabel()
    let authorLabel = UILabel()
    let titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupWithModel(model: ModelTable) {
        if let url = model.imageNews {
            getImageDataFrom(url: url)
        }
        
        titleLabel.text = model.titleNews
        descriptionLabel.text = model.descriptionNew
        authorLabel.text = model.author
    }
    
    private func getImageDataFrom(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.avatarImageView.image = image
                }
            }
        }.resume()
    }
}


extension CustomTableViewCell {
    
    func setupViews() {
        addViews()
        setupImageView()
        setupLabels()
        setupLayout()
        setupAutoresizingMask()
    }
    
    func setupAutoresizingMask() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
    }
    
    func setupImageView() {
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.layer.masksToBounds = true
    }
    
    func setupLabels() {
        titleLabel.font = titleLabel.font.withSize(18)
        titleLabel.numberOfLines = 2
        titleLabel.shadowColor = .lightGray
        titleLabel.shadowOffset = CGSize(width: -1.5, height: -1.5)
        titleLabel.textColor = .black
        
        descriptionLabel.font = descriptionLabel.font.withSize(15)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .systemBlue
        
        authorLabel.font = authorLabel.font.withSize(15)
        authorLabel.textColor = .red
    }
    
    func setupLayout() {
        authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15 ).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15 ).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        avatarImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
}
