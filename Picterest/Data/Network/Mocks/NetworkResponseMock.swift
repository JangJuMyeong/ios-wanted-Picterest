//
//  NetworkMock.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
import UIKit

struct NetworkResponseMock {
    static let photoList: Data = """
                            [
                                {
                                    "id": "siy3D89AqJw",
                                    "created_at": "2022-07-07T17:17:44Z",
                                    "updated_at": "2022-08-30T12:32:39Z",
                                    "promoted_at": "2022-07-07T18:08:01Z",
                                    "width": 3858,
                                    "height": 5139,
                                    "color": "#262626",
                                    "blur_hash": "LEE:6+DNX70Kx^a#n$Mx4nI:Rj-p",
                                    "description": null,
                                    "alt_description": null,
                                    "urls": {
                                        "raw": "https://images.unsplash.com/photo-1657214058650-31cc8400713b?ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1",
                                        "full": "https://images.unsplash.com/photo-1657214058650-31cc8400713b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80",
                                        "regular": "https://images.unsplash.com/photo-1657214058650-31cc8400713b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=1080",
                                        "small": "https://images.unsplash.com/photo-1657214058650-31cc8400713b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=400",
                                        "thumb": "https://images.unsplash.com/photo-1657214058650-31cc8400713b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=200",
                                        "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1657214058650-31cc8400713b"
                                    },
                                    "links": {
                                        "self": "https://api.unsplash.com/photos/siy3D89AqJw",
                                        "html": "https://unsplash.com/photos/siy3D89AqJw",
                                        "download": "https://unsplash.com/photos/siy3D89AqJw/download?ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA",
                                        "download_location": "https://api.unsplash.com/photos/siy3D89AqJw/download?ixid=MnwyMzUxMDZ8MXwxfGFsbHwxfHx8fHx8Mnx8MTY2MTg3MzQ4OA"
                                    },
                                    "categories": [],
                                    "likes": 40,
                                    "liked_by_user": false,
                                    "current_user_collections": [],
                                    "sponsorship": {
                                        "impression_urls": [],
                                        "tagline": "Memory storage made for everyone",
                                        "tagline_url": "https://www.samsung.com/us/memory-storage/",
                                        "sponsor": {
                                            "id": "eySMK9KwmJU",
                                            "updated_at": "2022-08-30T15:20:55Z",
                                            "username": "samsungmemory",
                                            "name": "Samsung Memory",
                                            "first_name": "Samsung",
                                            "last_name": "Memory",
                                            "twitter_username": "SamsungSemiUS",
                                            "portfolio_url": "http://www.samsung.com/us/computing/memory-storage/",
                                            "bio": "Memory for every endeavor – get fast storage solutions that work seamlessly with your devices.",
                                            "location": null,
                                            "links": {
                                                "self": "https://api.unsplash.com/users/samsungmemory",
                                                "html": "https://unsplash.com/@samsungmemory",
                                                "photos": "https://api.unsplash.com/users/samsungmemory/photos",
                                                "likes": "https://api.unsplash.com/users/samsungmemory/likes",
                                                "portfolio": "https://api.unsplash.com/users/samsungmemory/portfolio",
                                                "following": "https://api.unsplash.com/users/samsungmemory/following",
                                                "followers": "https://api.unsplash.com/users/samsungmemory/followers"
                                            },
                                            "profile_image": {
                                                "small": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                                                "medium": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                                                "large": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                                            },
                                            "instagram_username": "samsungsemiconductor",
                                            "total_collections": 0,
                                            "total_likes": 0,
                                            "total_photos": 548,
                                            "accepted_tos": true,
                                            "for_hire": false,
                                            "social": {
                                                "instagram_username": "samsungsemiconductor",
                                                "portfolio_url": "http://www.samsung.com/us/computing/memory-storage/",
                                                "twitter_username": "SamsungSemiUS",
                                                "paypal_email": null
                                            }
                                        }
                                    },
                                    "topic_submissions": {},
                                    "user": {
                                        "id": "eySMK9KwmJU",
                                        "updated_at": "2022-08-30T15:20:55Z",
                                        "username": "samsungmemory",
                                        "name": "Samsung Memory",
                                        "first_name": "Samsung",
                                        "last_name": "Memory",
                                        "twitter_username": "SamsungSemiUS",
                                        "portfolio_url": "http://www.samsung.com/us/computing/memory-storage/",
                                        "bio": "Memory for every endeavor – get fast storage solutions that work seamlessly with your devices.",
                                        "location": null,
                                        "links": {
                                            "self": "https://api.unsplash.com/users/samsungmemory",
                                            "html": "https://unsplash.com/@samsungmemory",
                                            "photos": "https://api.unsplash.com/users/samsungmemory/photos",
                                            "likes": "https://api.unsplash.com/users/samsungmemory/likes",
                                            "portfolio": "https://api.unsplash.com/users/samsungmemory/portfolio",
                                            "following": "https://api.unsplash.com/users/samsungmemory/following",
                                            "followers": "https://api.unsplash.com/users/samsungmemory/followers"
                                        },
                                        "profile_image": {
                                            "small": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                                            "medium": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                                            "large": "https://images.unsplash.com/profile-1602741027167-c4d707fcfc85image?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                                        },
                                        "instagram_username": "samsungsemiconductor",
                                        "total_collections": 0,
                                        "total_likes": 0,
                                        "total_photos": 548,
                                        "accepted_tos": true,
                                        "for_hire": false,
                                        "social": {
                                            "instagram_username": "samsungsemiconductor",
                                            "portfolio_url": "http://www.samsung.com/us/computing/memory-storage/",
                                            "twitter_username": "SamsungSemiUS",
                                            "paypal_email": null
                                        }
                                    }
                                },
                                {
                                    "id": "RHOKMe2VvRE",
                                    "created_at": "2022-08-30T14:18:40Z",
                                    "updated_at": "2022-08-30T15:24:01Z",
                                    "promoted_at": "2022-08-30T15:24:01Z",
                                    "width": 3600,
                                    "height": 5400,
                                    "color": "#8c7359",
                                    "blur_hash": "LKC?P?RPM|R+0fM{oJa{Vsxut7oJ",
                                    "description": null,
                                    "alt_description": null,
                                    "urls": {
                                        "raw": "https://images.unsplash.com/photo-1661868678303-493a20e5c4ca?ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1",
                                        "full": "https://images.unsplash.com/photo-1661868678303-493a20e5c4ca?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80",
                                        "regular": "https://images.unsplash.com/photo-1661868678303-493a20e5c4ca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=1080",
                                        "small": "https://images.unsplash.com/photo-1661868678303-493a20e5c4ca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=400",
                                        "thumb": "https://images.unsplash.com/photo-1661868678303-493a20e5c4ca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA&ixlib=rb-1.2.1&q=80&w=200",
                                        "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1661868678303-493a20e5c4ca"
                                    },
                                    "links": {
                                        "self": "https://api.unsplash.com/photos/RHOKMe2VvRE",
                                        "html": "https://unsplash.com/photos/RHOKMe2VvRE",
                                        "download": "https://unsplash.com/photos/RHOKMe2VvRE/download?ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA",
                                        "download_location": "https://api.unsplash.com/photos/RHOKMe2VvRE/download?ixid=MnwyMzUxMDZ8MHwxfGFsbHwyfHx8fHx8Mnx8MTY2MTg3MzQ4OA"
                                    },
                                    "categories": [],
                                    "likes": 0,
                                    "liked_by_user": false,
                                    "current_user_collections": [],
                                    "sponsorship": null,
                                    "topic_submissions": {
                                        "current-events": {
                                            "status": "approved",
                                            "approved_on": "2022-08-30T14:47:26Z"
                                        }
                                    },
                                    "user": {
                                        "id": "Ebxg7G-6FlA",
                                        "updated_at": "2022-08-30T15:25:54Z",
                                        "username": "dibakar16roy",
                                        "name": "Dibakar Roy",
                                        "first_name": "Dibakar",
                                        "last_name": "Roy",
                                        "twitter_username": "dbkr_roy",
                                        "portfolio_url": null,
                                        "bio": null,
                                        "location": "Kolkata, India.",
                                        "links": {
                                            "self": "https://api.unsplash.com/users/dibakar16roy",
                                            "html": "https://unsplash.com/@dibakar16roy",
                                            "photos": "https://api.unsplash.com/users/dibakar16roy/photos",
                                            "likes": "https://api.unsplash.com/users/dibakar16roy/likes",
                                            "portfolio": "https://api.unsplash.com/users/dibakar16roy/portfolio",
                                            "following": "https://api.unsplash.com/users/dibakar16roy/following",
                                            "followers": "https://api.unsplash.com/users/dibakar16roy/followers"
                                        },
                                        "profile_image": {
                                            "small": "https://images.unsplash.com/profile-fb-1599924775-34f7eda4baa5.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                                            "medium": "https://images.unsplash.com/profile-fb-1599924775-34f7eda4baa5.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                                            "large": "https://images.unsplash.com/profile-fb-1599924775-34f7eda4baa5.jpg?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"
                                        },
                                        "instagram_username": "https://www.instagram.com/dbkr.roy/",
                                        "total_collections": 0,
                                        "total_likes": 0,
                                        "total_photos": 352,
                                        "accepted_tos": true,
                                        "for_hire": true,
                                        "social": {
                                            "instagram_username": "https://www.instagram.com/dbkr.roy/",
                                            "portfolio_url": null,
                                            "twitter_username": "dbkr_roy",
                                            "paypal_email": null
                                        }
                                    }
                                }
                            ]
                            """.data(using: .utf8)!
    static let photoSearch: Data = """
                                    {
                                       "total":133,
                                       "total_pages":7,
                                       "results":[
                                          {
                                             "id":"eOLpJytrbsQ",
                                             "created_at":"2014-11-18T14:35:36-05:00",
                                             "width":4000,
                                             "height":3000,
                                             "color":"#A7A2A1",
                                             "blur_hash":"LaLXMa9Fx[D%~q%MtQM|kDRjtRIU",
                                             "likes":286,
                                             "liked_by_user":false,
                                             "description":"A man drinking a coffee.",
                                             "user":{
                                                "id":"Ul0QVz12Goo",
                                                "username":"ugmonk",
                                                "name":"Jeff Sheldon",
                                                "first_name":"Jeff",
                                                "last_name":"Sheldon",
                                                "instagram_username":"instantgrammer",
                                                "twitter_username":"ugmonk",
                                                "portfolio_url":"http://ugmonk.com/",
                                                "profile_image":{
                                                   "small":"https://images.unsplash.com/profile-1441298803695-accd94000cac?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=7cfe3b93750cb0c93e2f7caec08b5a41",
                                                   "medium":"https://images.unsplash.com/profile-1441298803695-accd94000cac?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64&s=5a9dc749c43ce5bd60870b129a40902f",
                                                   "large":"https://images.unsplash.com/profile-1441298803695-accd94000cac?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128&s=32085a077889586df88bfbe406692202"
                                                },
                                                "links":{
                                                   "self":"https://api.unsplash.com/users/ugmonk",
                                                   "html":"http://unsplash.com/@ugmonk",
                                                   "photos":"https://api.unsplash.com/users/ugmonk/photos",
                                                   "likes":"https://api.unsplash.com/users/ugmonk/likes"
                                                }
                                             },
                                             "current_user_collections":[

                                             ],
                                             "urls":{
                                                "raw":"https://images.unsplash.com/photo-1416339306562-f3d12fefd36f",
                                                "full":"https://hd.unsplash.com/photo-1416339306562-f3d12fefd36f",
                                                "regular":"https://images.unsplash.com/photo-1416339306562-f3d12fefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=92f3e02f63678acc8416d044e189f515",
                                                "small":"https://images.unsplash.com/photo-1416339306562-f3d12fefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=263af33585f9d32af39d165b000845eb",
                                                "thumb":"https://images.unsplash.com/photo-1416339306562-f3d12fefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=8aae34cf35df31a592f0bef16e6342ef"
                                             },
                                             "links":{
                                                "self":"https://api.unsplash.com/photos/eOLpJytrbsQ",
                                                "html":"http://unsplash.com/photos/eOLpJytrbsQ",
                                                "download":"http://unsplash.com/photos/eOLpJytrbsQ/download"
                                             }
                                          }
                                       ]
                                    }
                                    """.data(using: .utf8)!
    static let image: Data = UIImage(systemName: "square")!.pngData()!
}
